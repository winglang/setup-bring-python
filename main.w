bring cloud;
bring python;
bring expect;

let bucket = new cloud.Bucket();

let func = new cloud.Function(new python.InflightFunction(
  path: "./src",
  handler: "main.handler",
  lift: {
    store: {
      obj: bucket,
      allow: ["put"],
    },
  }
));

test "will write to bucket" {
  func.invoke("my-value");
  expect.equal(bucket.get("my-key"), "my-value");
}
