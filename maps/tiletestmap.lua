return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "git",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 4,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tiles",
      firstgid = 1,
      class = "",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 5,
      image = "tiles.png",
      imagewidth = 320,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      wangsets = {},
      tilecount = 5,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      id = 3,
      name = "Tile Layer 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        2, 2, 1, 1, 1, 5, 1, 1, 1, 1,
        5, 2, 1, 1, 1, 1, 1, 1, 5, 1,
        1, 2, 2, 2, 2, 5, 1, 1, 1, 4,
        1, 1, 5, 2, 2, 2, 2, 1, 1, 3,
        1, 1, 1, 1, 4, 1, 2, 1, 1, 1,
        1, 1, 1, 1, 3, 1, 2, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 2, 1, 1, 4,
        1, 1, 5, 1, 1, 5, 2, 5, 1, 3,
        4, 1, 1, 1, 1, 1, 2, 2, 2, 2,
        3, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    }
  }
}
