import logging
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  

# Create a logger
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# Create a file handler and set the logging format
file_handler = logging.FileHandler('server.log')
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

@app.route('/api/message', methods=['GET'])
def home():
    logger.info('Received request for /api/message')
<<<<<<< HEAD
    return jsonify({"message": "Hello from server! on AWS 1"}), 200
=======
    return jsonify({"message": "Hello from server! on postman"}), 200
>>>>>>> 20456e62decb2a5dd72556a2eab40104e142a0c7

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)