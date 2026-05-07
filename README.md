# 🚀 Space Shooter 3D (Prototipo en Godot 4.6)

Un frenético juego de disparos espacial en 3D con estética retro, desarrollado desde cero utilizando **Godot Engine 4**. 

Este proyecto está diseñado con un fuerte enfoque en la **optimización extrema y el rendimiento**, garantizando que pueda correr a 60 FPS estables incluso en computadoras con hardware muy limitado (sin GPU dedicada), utilizando el renderizador de Compatibilidad (OpenGL).

## ✨ Características actuales

* **Mecánicas de Vuelo:** Movimiento suave en los ejes X e Y, con efecto de inclinación dinámica (*banking*) al moverse hacia los lados.
* **Sistema de Combate:** Disparo de láseres gemelos con cooldown optimizado para evitar la saturación del motor físico.
* **Generación de Enemigos:** Sistema de *spawner* automatizado que instancia enemigos en coordenadas aleatorias en el eje Z.
* **VFX y SFX Optimizados:** * Partículas de velocidad estelar (Warp speed) utilizando `CPUParticles3D` para aligerar la carga de la tarjeta gráfica.
  * Efectos visuales de explosión de escombros instanciados dinámicamente al destruir enemigos.
  * Sonidos independientes (láser y explosión) mediante nodos autodestructibles para asegurar una reproducción limpia sin cortes.
* **Estética Retro:** Implementación de un Shader personalizado de **Efecto CRT** (Scanlines y Viñeta) renderizado a través de un `CanvasLayer`, logrando un look arcade clásico con un costo computacional casi nulo.

## 🛠️ Detalles Técnicos y Optimización

Para lograr un rendimiento fluido en equipos de bajos recursos y sistemas Linux, se han aplicado las siguientes técnicas:
- **Iluminación "Unshaded":** Los láseres y escombros brillan por su propia textura, evitando cálculos de luces y sombras en tiempo real.
- **SDFGI y SSAO Desactivados:** El `WorldEnvironment` ha sido limpiado de costosos efectos de iluminación global.
- **Gestión de Memoria:** Destrucción estricta de balas, enemigos y sistemas de partículas/audio mediante `queue_free()` al salir de la pantalla o terminar su ciclo, evitando fugas de memoria (memory leaks).
- **Límite de FPS:** El motor está configurado para un límite seguro, protegiendo el procesador de sobrecalentamientos innecesarios.

## 🗺️ Hoja de Ruta (Próximas actualizaciones)

Este es un proyecto en constante evolución. Las siguientes características están planeadas para futuras versiones:
- [ ] Interfaz de Usuario (HUD) para conteo de puntuación.
- [ ] Sistema de Misiones (ej. destruir X cantidad de enemigos).
- [ ] Menú Principal (Pantalla de Título).
- [ ] Música de fondo dinámica.

## 🕹️ Cómo jugar (Para desarrolladores)

1. Clona este repositorio.
2. Abre **Godot Engine 4.x** e importa el archivo `project.godot`.
3. Abre la escena `main.tscn`.
4. Presiona **F5** para ejecutar el juego.
5. Muévete con las flechas direccionales o WASD y dispara con el botón asignado (Barra Espaciadora), también puedes conectar un mando para jugar, como de PS4 y pulsar X para disparar.
6. Si quieres salir puedes presionar Alt + Tab para cambiar de pantalla, no tiene función de salir.
