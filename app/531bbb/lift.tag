<lift>
  <section id={opts.name}0>{opts.name}3x5</section>
  <section id={opts.name}1>{opts.name}3x3</section>
  <section id={opts.name}2>{opts.name}531</section>
  <section id={opts.name}3>{opts.name}DL</section>
  <style scoped>
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
    }
  </style>
</lift>
