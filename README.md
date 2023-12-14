# Clean Architecture

The following project contains a guide on how a project could look like when applying clean architecture. It has the following main folders: Core and Features.

## Core

Here, you'll find utilities, global widgets, as well as services that can be used in different project features.
Features: This encapsulates different screens, functionalities that our app may have, as well as communication with a third-party API or a local database. Each feature is divided into three parts:

### Presentation

This includes Pages (Screens), Bloc (which serves as the state manager in this case), Widgets (widgets used exclusively within this module).

### Domain

Here reside use cases (responsible for performing the assigned necessary logic), Entities (classes that govern our business logic), and Repositories (all interactions our entity has externally or locally).

### Data

Within Data, you'll find DataSource (the service for communication with external or local entities), Repositories (implementation of repositories found in Domain), Models (these are mappers that adjust data as requested by the API or service).
