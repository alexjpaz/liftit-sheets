<lift>
  <span>{ opts.name }</span>
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
