from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/sanskar')
def sanskar():
    name = "sanskar"
    return render_template('sanskar.html', name2= name)

app.run(debug=True)