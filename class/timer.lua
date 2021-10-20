timer = _{
  time = 0,
  timeout = 1,
  callback = function(this)
    error("no callback on timer!")
  end,
  -- timeout, callback
  update = function(this)
    this.time += 1
    if this.timeout <= this.time then
      this.callback(this)
    end
  end,
}
