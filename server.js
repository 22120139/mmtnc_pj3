const http = require('http');
const server = http.createServer((req, res) => {
res.statusCode = 200;
res.setHeader('Content-Type', 'text/plain');
res.end('Hello from Dockerized Node.js App\n');
});
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
console.log(`Server running at port ${PORT}`);
});
