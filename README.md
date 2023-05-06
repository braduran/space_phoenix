# space_phoenix
Proyecto de práctica sobre el framework Phoenix en Elixir.

1. ``docker-compose up -d``
2. Crear proyecto phoenix
```code   
mix phx.new space_phoenix --no-install --app space_phoenix --database postgres --no-live --no-assets --no-html --no-dashboard --no-mailer --binary-id
```
3. Obtener dependencias 
``mix deps.get``
4. Crear base de datos
``mix ecto.create``