from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
import json
import os
import math
from datetime import datetime

with open('config.json', 'r') as c:
    params = json.load(c) ["params"]
local_server = True

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    Mail_SERVER = 'smtp.gmail.com',
    MAIL_PORT = 465,
    MAIL_USE_SSL = True, 
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_password']
)
mail = Mail(app)
if(local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True) 
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20),nullable=False)
    
class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True) 
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(20),nullable=False)
    tagline = db.Column(db.String(20),nullable=False)


@app.route('/')
def home():
    # flash("Hello my name is sanskar", "success")
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['num_of_posts']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    
    posts = posts[(page-1) *int(params['num_of_posts']): (page-1)*int(params['num_of_posts']) + int(params['num_of_posts'])]
    # Pagination Logic
    if (page==1):
        prev = "#"
        next = "/?page="+ str(page + 1)
    elif (page==last):
        prev = "/?page="+ str(page - 1)
        next = "#"
    else:
        prev = "/?page="+ str(page - 1)
        next = "/?page="+ str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)


@app.route('/about')
def about():
    return render_template('about.html', params= params)


@app.route('/dashboard', methods = ["GET", "POST"])
def dashboard():

    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.all()
        return render_template('dashboard.html', params= params, posts= post)

    if(request.method == 'POST'):
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if(username == params['admin_user'] and userpass == params['admin_password']):
            # Set the session variable
            session['user'] = username
            post = Posts.query.all()
            return render_template('dashboard.html', params= params, posts= post)
    else:
        return render_template('login.html', params= params)


@app.route('/edit/<string:sno>', methods =['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            box_title = request.form.get('title')   
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post = Posts(title=box_title, tagline=tagline, slug=slug, content=content, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.tagline = tagline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params= params, post=post, sno=sno)


@app.route('/uploader', methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename) ))
            return "Uploaded Succesfully"


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/delete/<string:sno>')
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/contact', methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone_num')
        message = request.form.get('message')

        entry = Contacts(name=name, email=email, phone_num=phone_num, date = datetime.now(), msg=message)
        db.session.add(entry)
        db.session.commit() 
        mail.send_message('New message from Blog TheCoder by' + name, 
                        sender=email, 
                        recipients = [params['gmail_user']],
                        body = message + "\n" + phone_num
                        )
        flash("Thanks for submitting details, We will get back to you soon", "success")
    return render_template('contact.html', params= params)


@app.route('/post/<string:post_slug>', methods =['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params= params, post= post)


app.run(debug=True)