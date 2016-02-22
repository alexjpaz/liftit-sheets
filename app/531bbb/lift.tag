<lift>
  <section each={ w in api.weekOrder } id="{parent.opts.name}{w}">
    <card>
      <strong>{parent.opts.name}{w}</strong>
      <h1>lkol</h1>
      <h1>lkol</h1>
      <h1>lkol</h1>
      <h1>lkol</h1>
      <h1>lkol</h1>
      <h1>lkol</h1>
      <h1>lkol</h1>
    </card>
  </section>
  <script>
    var api = this.api = opts.api;
  </script>
  <style>
    card {
      position: relative;
      display: block;
      background: blue;
      margin: 8px;
      padding: 8px;
      box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
      border-radius: 2px;
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

      lift card {
        background: white;
      }
    }
  </style>
</lift>
