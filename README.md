# BookStore - Base de Datos y Scripts SQL

Este repositorio contiene el diseño, los scripts y la documentación para la gestión de una base de datos de una librería utilizando MariaDB/MySQL. Incluye la creación de tablas, inserción de datos, gestión de usuarios, procedimientos almacenados, triggers, optimización de consultas y automatización de copias de seguridad.

## Estructura del repositorio

```
BookStore/
│   BookStore.md
│   BookStore.sql
│
└───img/
    │   diagrama.png
```

- **BookStore.sql**: Script SQL principal para crear la base de datos, tablas, insertar datos, crear usuarios, procedimientos almacenados, triggers, índices y scripts de backup.
- **BookStore.md**: Documentación detallada del proyecto, explicando el diseño, las decisiones tomadas y ejemplos de uso.
- **img/diagrama.png**: Diagrama entidad-relación (ER) de la base de datos.

## Cómo utilizar los archivos

1. **Requisitos**: Tener instalado MariaDB/MySQL y un cliente como HeidiSQL o DBeaver.

2. **Crear la base de datos y las tablas**:
   - Abre el archivo [`BookStore.sql`](BookStore/BookStore.sql) en tu cliente SQL.
   - Ejecuta el script para crear la base de datos, las tablas y poblarlas con datos de ejemplo.

3. **Gestión de usuarios**:
   - El script crea dos usuarios: `gerente` (acceso total) y `agente_ventas` (acceso limitado).
   - Modifica las contraseñas según tus necesidades antes de ejecutar.

4. **Procedimientos y triggers**:
   - El script incluye un procedimiento almacenado para registrar pedidos y actualizar el inventario automáticamente.
   - También incluye un trigger para generar informes diarios de ventas por género.

5. **Optimización y consultas**:
   - Se crean índices para mejorar el rendimiento de las consultas.
   - Incluye ejemplos de consultas complejas y su análisis con `EXPLAIN`.

6. **Copias de seguridad**:
   - El script contiene ejemplos de archivos batch (.bat) para automatizar copias de seguridad diarias usando `mysqldump`.
   - Puedes programar estos scripts con el Programador de Tareas de Windows.

7. **Documentación**:
   - Consulta [`BookStore.md`](BookStore/BookStore.md) para una explicación detallada del diseño, las relaciones y el uso de cada parte del sistema.
   - El diagrama ER está disponible en [`img/diagrama.png`](BookStore/img/diagrama.png).

## Notas

- Personaliza los nombres de usuario, contraseñas y rutas de archivos según tu entorno.
- El repositorio está pensado para fines educativos y demostrativos.

## Créditos y referencias

Consulta la sección de **WEBGRAFÍA** en [`BookStore.md`](BookStore/BookStore.md) para enlaces útiles y documentación adicional.
