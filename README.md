# Notice

Work in Progress...

# Example

To get a fully functional, but beautiful Fileinput, you need a markup like this

    <div class="input-group">
      <input class="fileinput-input" type="file" name="image">
      <input type="text" class="form-control feedback" placeholder="Nothing found" readonly>
      <span class="input-group-btn">
        <button class="btn btn-primary fileinput">Browse</button>
      </span>
    </div>

and call your new Fileinput via Javascript

    $(".fileinput").fileinput()
