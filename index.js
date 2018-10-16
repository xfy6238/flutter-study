const server = require("http")
  .createServer((req, res) => {
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
    }
  })
  .listen(9100, () => {
    console.log("run on 9100");
  });
