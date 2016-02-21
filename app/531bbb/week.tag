<week>
  <table>
    <tr>
      <td each={ lb in liftit.config.plates }>
        {lb}
      </td>
    </tr>
    <tr each={ row in rows}>
      <td each={ lb in liftit.config.plates }>
        {row.map[lb] }
      </td>
    </tr>
  <table>
  <pre>{ JSON.stringify(this.derp, null, 4) }</pre>
  <script>
    var liftit = this.liftit = opts.api.liftit;

    this.rows = [
      liftit.plates(opts.weight)
    ];
  </script>
</week>
