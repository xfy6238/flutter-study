const server = require("http")
  .createServer((req, res) => {
    console.log(req.url);
    if (req.url === "/getData") {
      res.end(
        JSON.stringify({
          name: "fanzk",
          info: {
            age: 30
          },
          records: [
            {
              id: 'akjdfla',
              time: '2018-10-15'
            },
            {
              id: 'fgafsdaf',
              time: '2018-10-12'
            }
          ]
        })
      );
    }
  })
  .listen(9100, () => {
    console.log("run on 9100");
  });
