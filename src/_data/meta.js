const axios = require("axios");

module.exports = async function() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  } catch (error) {
    console.error(error);
  }

};
