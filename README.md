# Clara — Finanzas personales

Prototipo estático para registrar movimientos y explorar una previsión de gastos.

## Publicar en GitHub Pages

1. Crear un repositorio público en GitHub. GitHub Pages está incluido en GitHub Free para repositorios públicos de cuentas personales.
2. Subir estos archivos a la rama `main`.
3. En **Settings → Pages**, seleccionar **GitHub Actions** como origen.
4. El workflow de este repositorio publica el sitio al subir cambios a `main`. La URL aparece en **Settings → Pages** cuando termina la primera publicación.

## Datos y privacidad

- El sitio es público y el código del repositorio también será público.
- Los movimientos y gastos previstos se guardan en `localStorage` del navegador. No se envían a GitHub ni se sincronizan entre computadora y celular.
- No cargar datos personales en archivos del repositorio. Cada dispositivo tendrá su propia copia local de los datos.
- Borrar los datos del navegador puede eliminar esa copia.

Los importes y movimientos iniciales son datos ficticios de muestra.
