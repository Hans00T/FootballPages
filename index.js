require('dotenv').config();
const app = require('./template/app');

let port = process.env.PORT || 3000;
let hostname = process.env.HOST || 'localhost';

app.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});
