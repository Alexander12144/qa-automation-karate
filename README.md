# QA Automation Karate

[![Java](https://img.shields.io/badge/Java-17-blue.svg)](https://openjdk.java.net/)
[![Karate](https://img.shields.io/badge/Karate-1.5.0-green.svg)](https://github.com/karatelabs/karate)
[![Maven](https://img.shields.io/badge/Maven-3.11.0-orange.svg)](https://maven.apache.org/)

## 📋 Descripción

Proyecto de automatización de pruebas API desarrollado con **Karate DSL**, un framework BDD (Behavior-Driven Development) que permite escribir pruebas en un lenguaje natural Gherkin sin necesidad de escribir código Java adicional.

El proyecto está diseñado para validar funcionalidades CRUD (Create, Read, Update, Delete) de usuarios a través de una API REST, incluyendo flujos completos de integración y manejo de autenticación mediante tokens.

## 🎯 Objetivos

- **Automatización de pruebas API**: Validar el correcto funcionamiento de endpoints REST
- **Pruebas de integración**: Ejecutar flujos completos que combinan múltiples operaciones
- **Validación de respuestas**: Verificar status codes, estructura y contenido de respuestas JSON
- **Gestión de autenticación**: Manejo de tokens Bearer para endpoints protegidos
- **Generación de reportes**: Integración con Allure para visualización detallada de resultados

## 🚀 Tecnologías Utilizadas

| Tecnología | Versión | Descripción |
|------------|---------|-------------|
| Java | 17 | Lenguaje base del proyecto |
| Karate | 1.5.0 | Framework de automatización API |
| Maven | 3.11.0 | Gestor de dependencias y build |
| JUnit 5 | - | Framework de testing |
| Allure | 2.12.0 | Generador de reportes |
| GoRest API | - | API bajo prueba (ambiente sandbox) |

## 📁 Estructura del Proyecto

```
myproject2/
├── src/
│   └── test/
│       ├── java/
│       │   └── runners/
│       │       └── TestRunner.java          # Punto de entrada para ejecutar tests
│       └── resources/
│           ├── features/
│           │   ├── auth/
│           │   │   └── login.feature        # Autenticación y obtención de token
│           │   ├── users/
│           │   │   ├── create-user.feature      # Crear usuario individual
│           │   │   ├── get-user.feature         # Consultar usuario
│           │   │   ├── upgrade-user.feature     # Actualizar usuario
│           │   │   ├── delete-user.feature      # Eliminar usuario
│           │   │   ├── get-user-not-found.feature # Validar 404
│           │   │   └── multi-users/
│           │   │       └── create-mult-user.feature # Crear múltiples usuarios (data-driven)
│           │   └── flows/
│           │       └── user-flow.feature        # Flujo completo de integración
│           ├── karate-config.js             # Configuración global (baseUrl, token, env)
│           └── logback-test.xml             # Configuración de logs
├── pom.xml                                  # Dependencias y configuración Maven
└── README.md                                # Documentación del proyecto
```

## 📝 Casos de Prueba

### 1. Autenticación (`auth/login.feature`)
- **Propósito**: Obtener token de acceso para la API
- **Endpoint**: POST /login
- **Validaciones**: Verificar que el token retornado es un string válido

### 2. CRUD de Usuarios (`features/users/`)

| Feature | Método | Endpoint | Status Code | Descripción |
|---------|--------|----------|-------------|-------------|
| create-user.feature | POST | /users | 201 | Crea un usuario con email único |
| get-user.feature | GET | /users/{id} | 200 | Consulta un usuario existente |
| upgrade-user.feature | PUT | /users/{id} | 200 | Actualiza datos de un usuario |
| delete-user.feature | DELETE | /users/{id} | 204 | Elimina un usuario |
| get-user-not-found.feature | GET | /users/{id} | 404 | Valida que usuario eliminado no existe |

### 3. Pruebas Data-Driven (`features/users/multi-users/`)

| Feature | Método | Endpoint | Status Code | Descripción |
|---------|--------|----------|-------------|-------------|
| create-mult-user.feature | POST | /users | 201 | Crea múltiples usuarios usando Examples (data-driven testing) con generación de emails únicos mediante UUID |

**Características del test data-driven:**
- Utiliza `Scenario Outline` con `Examples` para ejecutar el mismo test con diferentes datos
- Genera emails únicos automáticamente usando `java.util.UUID.randomUUID()`
- Permite validar la creación de usuarios con diferentes combinaciones de nombre y género
- Implementa función personalizada para formatear emails: `nombre.apellido.uuid@example.com`

### 4. Flujo de Integración (`features/flows/user-flow.feature`)
- **Propósito**: Ejecutar un flujo completo de principio a fin
- **Pasos**:
  1. Crear usuario nuevo
  2. Consultar usuario creado
  3. Actualizar información del usuario
  4. Eliminar usuario
  5. Validar que el usuario eliminado retorna 404

## ⚙️ Configuración

### Requisitos Previos

- Java 17 o superior
- Maven 3.6+
- Git

### Variables de Entorno

El archivo `karate-config.js` contiene la configuración global:

```javascript
{
  env: 'dev',                    // Ambiente: dev, e2e, etc.
  baseUrl: 'https://gorest.co.in/public/v2',
  token: '68a45b1e1d0ad1ac521b19c6e0725c4a22c7a57efe607936d45811e49361f809'
}
```

### Ejecutar Pruebas

**Ejecutar todas las pruebas:**
```bash
mvn test
```

**Ejecutar un feature específico:**
```bash
mvn test -Dkarate.options="classpath:features/users/create-user.feature"
```

**Ejecutar con tag específico:**
```bash
mvn test -Dkarate.tags="@smoke"
```

**Ejecutar en diferente ambiente:**
```bash
mvn test -Dkarate.env=qa
```

## 📊 Generar Reportes

### Allure Report

1. Ejecutar las pruebas:
   ```bash
   mvn clean test
   ```

2. Generar y visualizar el reporte:
   ```bash
   mvn allure:serve
   ```

3. O generar reporte estático:
   ```bash
   mvn allure:aggregate
   ```

Los reportes se generan en `target/allure-results/`

### Reportes HTML de Karate

Karate genera reportes HTML automáticamente en:
```
target/karate-reports/
```

## 🔧 Comandos Útiles

| Comando | Descripción |
|---------|-------------|
| `mvn clean test` | Limpiar y ejecutar todas las pruebas |
| `mvn test -DskipTests` | Compilar sin ejecutar tests |
| `mvn allure:serve` | Ver reportes Allure en el navegador |
| `mvn dependency:tree` | Ver árbol de dependencias |

## 🌍 Ambientes Configurados

| Ambiente | Variable | Uso |
|----------|----------|-----|
| dev | `-Dkarate.env=dev` | Desarrollo y pruebas locales (default) |
| e2e | `-Dkarate.env=e2e` | Pruebas end-to-end |

## 📦 Dependencias Principales

```xml
<dependency>
    <groupId>io.karatelabs</groupId>
    <artifactId>karate-junit5</artifactId>
    <version>1.5.0</version>
    <scope>test</scope>
</dependency>
```

## 🤝 Contribución

1. Crear un branch para la feature (`git checkout -b feature/nueva-funcionalidad`)
2. Hacer commit de los cambios (`git commit -m 'Agregar nueva funcionalidad'`)
3. Hacer push al branch (`git push origin feature/nueva-funcionalidad`)
4. Abrir un Pull Request

## 📄 Licencia

Este proyecto es de uso interno para fines de automatización de pruebas QA.

## 👤 Autor

Proyecto creado para automatización de pruebas API con Karate DSL.

## 📅 Versión

**Versión actual:** 1.0-SNAPSHOT

---

> **Nota:** La API utilizada para las pruebas es [GoRest](https://gorest.co.in/), una API pública de testing. El token configurado es para fines de demostración y puede requerir actualización periódica.
