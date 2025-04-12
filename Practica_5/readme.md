# **Exportación del Juego Godot a Diferentes Plataformas**  

Este documento explica cómo exportar tu juego desarrollado en **Godot Engine** a diferentes plataformas (Windows, Linux, macOS, Android, Web).  

---

## **📋 Requisitos Previos**  
- Godot Engine instalado ([Descargar Godot](https://godotengine.org/download))  
- Para **Android**:  
  - **Android Studio** instalado (para el SDK y JDK)  
  - **Plantillas de exportación** de Godot Android  
- Para **Web (HTML5)**:  
  - Plantillas de exportación Web  

---

## **📥 Instalación de Plantillas de Exportación**  
Antes de exportar, asegúrate de tener las plantillas necesarias:  

1. **Abre Godot** y ve a:  
   - `Editor` → `Administrar exportación de plantillas...`  
2. **Descarga las plantillas** para las plataformas que necesites:  
   - Si el botón **"Descargar e Instalar"** está deshabilitado:  
     - Descarga manualmente desde [godotengine.org/download](https://godotengine.org/download)  
     - Ve a `Instalar desde archivo` y selecciona el `.tpz` descargado.  

---

## **⚙️ Configuración de Exportación**  

### **1. Configuración General**  
- Ve a `Proyecto` → `Ajustes de Exportación...`  
- Selecciona las plataformas que necesites (Windows, Linux, Android, etc.)  

### **2. Exportar a Windows/Linux/macOS**  
1. **Selecciona la plataforma** en el menú de exportación.  
2. **Configura las opciones básicas**:  
   - Nombre del ejecutable  
   - Icono de la aplicación  
3. **Haz clic en "Exportar"** y guarda el archivo.  

### **3. Exportar a Android (APK/AAB)**  
1. **Configura el SDK de Android**:  
   - `Editor` → `Ajustes de Editor...` → `Exportación` → `Android`  
   - Establece las rutas:  
     - **Android SDK**: `C:\Users\[tu_usuario]\AppData\Local\Android\Sdk` (Windows)  
     - **JDK**: `C:\Program Files\Android\Android Studio\jbr`  
2. **Configura el paquete único**:  
   - Ejemplo: `com.tunombre.tujuego`  
3. **Exporta el APK/AAB**:  
   - `Proyecto` → `Exportar...` → Selecciona Android → Exportar  



