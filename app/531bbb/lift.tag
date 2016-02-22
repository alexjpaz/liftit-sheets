<lift>
  <section each={ w in api.weekOrder } id="{parent.opts.name}{w}">
    <card>{opts.name}3x5</card>
  </section>
  <script>
    var api = this.api = opts.api;
  </script>
  <style>
    card {
      background: blue;
      margin: 20px;
      width: 100%;
        height: 100%;
      box-shadow: 1px 1px 2px #aaa;
    }
    span {
      color: white;
      text-align: center;
      font-size: 2em;
    }
    pre {
      border: 1px solid green
    }
    @media (max-width: 600px) {
      :pre {
        border: 1px solid pink
        width: 100%;
        height: 100%;
      }

      lift section {
        background: white;
      }
    }
  </style>
</lift>
