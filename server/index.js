const server = require("http").createServer(hander);
const fs = require("fs");
const io = require("socket.io")(server);

function hander(req, res) {
  console.log(req.url);
  if (req.url === "/getData" && req.method === "GET") {
    setTimeout(() => {
      res.end(
        JSON.stringify({
          name: "fanzk",
          info: {
            age: 30
          },
          records: [
            {
              id: "akjdfla",
              time: "2018-10-15"
            },
            {
              id: "fgafsdaf",
              time: "2018-10-12"
            }
          ]
        })
      );
    }, 2000);
  } else if (req.url === "/post" && req.method === "POST") {
    let data = "";
    req.on("data", chunk => {
      data += chunk;
    });
    req.on("end", () => {
      setTimeout(() => {
        res.end(
          JSON.stringify({
            code: "200",
            data: null
          })
        );
      }, 2000);
    });
  } else if (req.url === "/index") {
    fs.createReadStream("./index.html").pipe(res);
  }
}

server.listen(9100, () => {
  console.log("run on 9100");
});

io.on("connection", socket => {
  console.log(1);
  socket.on("disconnect", () => {
    console.log("connect disconnect");
  });
});
