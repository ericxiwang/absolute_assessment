from app import app
from flask import render_template



@app.route('/')
@app.route('/index')
def index():
    user = { 'eric': 'wang' } # fake user
    return render_template("index.html",
        title = 'flask_app',
        user = user)

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
