# the main context

# scope or context of a method
def binding_elsewhere
  x = 20
  return binding
end
# Create a remote binding
remote_binding= binding_elsewhere

# variable in a main context
x = 10

eval("puts x")
eval("puts x", remote_binding)
