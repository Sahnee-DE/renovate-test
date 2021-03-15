use Mix.Config

if Mix.env() == :dev do
  # Include another config file during development
  # This file is normally only loaded in an actual release
  # Is this an ideal way to use this feature? Certainly not. Is it convenient for us? Absolutely :-)
  import_config "releases.exs"
end
