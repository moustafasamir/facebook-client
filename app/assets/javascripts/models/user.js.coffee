class Memories.Models.User extends Backbone.Model
  paramRoot: 'user'
  url: "/users"

class Memories.Models.CurrentUser extends Memories.Models.User
  url: "/users/current"