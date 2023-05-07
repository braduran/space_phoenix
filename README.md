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
4. Crear entidades con Ecto 
```code
mix phx.gen.json Cohetes Cohete cohetes num_ref:string marca:string peso:string altura:string capacidad:integer fecha_lanzamiento:date
```

```code
mix phx.gen.json Astronautas Astronauta astronautas cohete_id:references:cohetes num_id:integer nombre:string apellido:string fecha_nac:date lanzamientos:integer
``` 
5. Crear entidades en la BD
``mix ecto.migrate``
6. Si quiero hacer rollback de la creación de tablas de Ecto
``mix ecto.rollback --all``
7. ver los endpoints disponibles para consumir
``mix phx.routes``
8. Ejecutar la aplicación
``mix phx.server o  iex -S mix phx.server``

### Pruebas
Abrir el archivo space.jmx desde JMeter para hacer pruebas a los servicios 