_.states['test'] = {
  tests = {},
  coverage = {},
  to_cover = {},
  init = function(this)
    cls()
    print("loading coverage items...",5)
    for cover, item in pairs(this.coverage) do
      for k,v in pairs(item) do
        if type(v) == 'function' then
          local cover_key = cover..":"..k
          add(this.to_cover, cover_key)
          item[k] = function(...)
            del(this.to_cover, cover_key)
            return v(...)
          end
        end
      end
    end
    local total_cover = #this.to_cover
    print(#this.to_cover.." items to cover!",12)
    print("⧗ running tests!",5)
    for k,v in pairs(this.tests) do
      color(11)
      ?k..":\0"
      foreach(v, function(test)
        test()
        ?".\0"
      end)
      ?"♥"
    end
    print("♥ testing done!",12)
    print("covered "..total_cover-#this.to_cover.."/"..total_cover.." coverage items",5)
    if #this.to_cover > 0 then
      print("missing... ",9)
      foreach(this.to_cover, function(missed)
        print(missed,8)
      end)
    end
    stop()
  end,
}
_fixtures = {}
_tests = _.states['test'].tests
_coverage = _.states['test'].coverage

-->8
-- test overrides
spr = function() end
