module.exports = {
  entry: "./app/full/entry.js",
  output: {
    path: __dirname,
    filename: "dist/full/bundle.js"
  },
  module: {
    loaders: [
      { test: /\.css$/, loader: "style!css" }
    ]
  }
};
