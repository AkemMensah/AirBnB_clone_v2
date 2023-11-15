#!/usr/bin/python3
""" Script that start a Flask web application """

from flask import Flask


app = Flask(__name__)


#Define route for the root URL '/'
#@app.route('/', strict_slashes=False)
@app.route('/airbnb-onepage/', strict_slashes=False)
def hello_world():
    """ Returns the text Hello HBNB! """
    return 'Hello HBNB!'

if __name__ == '__main__':
    #Starts the Flask dev. server
    #Listen on all available network interface (0.0.0.0) and port 5000
    app.run(host='0.0.0.0', port=5000)
