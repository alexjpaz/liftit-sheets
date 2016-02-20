require('./month.tag');
require('./bottom.tag');

<app>
111
  { foo }
  { opts.version }
  <month></month>
  <bottom></bottom>
  <style scoped>
    h3 {
      font-size: px;
    }
  </style>
  <script>
    this.foo = opts.foo;
    this.hi = function() {
      return 42;
    };
  </script>
</app>
