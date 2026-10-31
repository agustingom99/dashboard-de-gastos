# Clara — Finanzas personales

Prototipo estático para registrar movimientos y explorar una previsión de gastos.

## Publicar en GitHub Pages

1. Crear un repositorio público en GitHub. GitHub Pages está incluido en GitHub Free para repositorios públicos de cuentas personales.
2. Subir estos archivos a la rama `main`.
3. En **Settings → Pages**, seleccionar **GitHub Actions** como origen.
4. El workflow de este repositorio publica el sitio al subir cambios a `main`. La URL aparece en **Settings → Pages** cuando termina la primera publicación.

## Datos y privacidad

- El sitio es público y el código del repositorio también será público.
- La conexión a Supabase usa una clave publicable. Las tablas tienen Row Level Security y cada usuario solo puede consultar y modificar sus propios datos.
- Creá una cuenta desde **Conectar cuenta**. Al iniciar sesión desde el celular o la computadora, los movimientos, ingresos, gastos previstos y disponible de previsión se sincronizan.
- Si tu navegador ya tiene datos guardados y la cuenta está vacía, Clara pregunta antes de copiarlos. Los datos ficticios de muestra no se copian.
- Si no iniciás sesión, los datos nuevos siguen guardándose solo en ese navegador.
- Usá una contraseña única y no guardes claves privadas de Supabase en este repositorio. La clave `service_role` nunca debe estar en el navegador.

### Configuración de Supabase

El esquema está en `supabase-schema.sql`. Las tablas son `finance_movements`, `finance_plans` y `finance_preferences`; la app se conecta al proyecto Clara Finanzas.

Los importes y movimientos iniciales son datos ficticios de muestra.
