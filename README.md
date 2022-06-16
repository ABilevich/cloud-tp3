# Cloud Computing - TP3

## Hortz
<img src="./resources/images/hortz.png" width="300" height="300" />

## Problema

Una empresa de alquiler de automóviles quiere expandirse a otras regiones nacionales e internacionales. La misma cuenta en la actualidad con un data center on-premise en sus oficinas y solo maneja alquileres locales. Al expandirse, deberá poder soportar una gran cantidad de conexiones simultáneas, provenientes de diversas locaciones y una alta disponibilidad.

Se necesita desarrollar un sistema que permita a los empleados de las sucursales manejar los alquileres y permitir a los gerentes ver métricas y tableros de BI para analizar el negocio y obtener estadísticas. Adicionalmente, los clientes deben poder registrarse para realizar alquileres.

## Solución

Se decide crear una única aplicación web para resolver todos los problemas. Esta aplicación se basa en una arquitectura serverless hosteada en la región en la que se encuentran las actuales oficinas de la empresa (mayor cantidad de clientes actuales), bajo múltiples zonas de disponibilidad para asegurar redundancia y alta disponibilidad.

Los recursos estáticos de la aplicación se encuentran en un bucket S3 Standard que nos da alta disponibilidad. Adicionalmente, utilizamos un CloudFront CDN para asegurar menor latencia si se accede desde distintas partes del mundo. Por otro lado, la capa de aplicación ejecutará funciones Lambda que realizan operaciones sobre una base de datos Aurora Serverless. Para la funcionalidad de BI requerida, utilizamos un Glue DataBrew ETL que transforma la base de datos transaccional Aurora en un formato que nos permita analizar mejor esta información y la vuelca en un Data Lake S3. Finalmente, se utiliza Athena para realizar queries a este bucket y mostrar la información en QuickSight que leerán los managers. Para garantizar la seguridad y las distintas funcionalidades por roles según el tipo de usuario que utilice la aplicación utilizamos Cognito para la autenticación, IAM para los permisos de los roles y WAF para la protección de la red.