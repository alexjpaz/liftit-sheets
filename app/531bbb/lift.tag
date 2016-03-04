
<lift>
  <section each={ w in api.weekOrder } id="{parent.opts.name}{w}">
    <card>
      <week weight={parent.opts.weight} type={w}></week>
    </card>
  </section>
  <script>
    var api = this.api = opts.api;
  </script>
  <style>

    @media (min-width: 992px), print {
      lift {        color: blue;
        color: blue;
        background: red;
        display: block

      }

      lift > section {
        float: left;
        display: block;
        width: 24%;
        margin-bottom: 20px;
        margin-right: 1%;
      }

      section:target {
        background: red;
      }
    }


    @media screen and (max-width: 992px) {
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
    }
  </style>
</lift>
