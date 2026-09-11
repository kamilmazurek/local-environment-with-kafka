# Local Development Environment with Apache Kafka

This repository contains an implementation of a local development environment, featuring Apache Kafka, ksqlDB, AKHQ, and Schema Registry.  The environment is built with Docker Compose, running Kafka in modern KRaft mode.
It provides a ready-to-use local infrastructure designed to quickly start working with Kafka, e.g., data engineering, building microservices, developing stream processing applications, performing data analysis, or designing ETL pipelines.

Key advantages:
* **Developer Productivity**: Ready-to-use, cross-platform setup lets developers start quickly while ensuring consistent infrastructure across teams.
* **Simple Architecture**: Runs Kafka in KRaft mode, simplifying local setup, accelerating boot times, and reducing memory usage.
* **Unified Visibility**: Pre-configured AKHQ provides a UI to visually inspect topics, manage consumer groups, and view messages.
* **Stream Processing Ready**: Includes ksqlDB server and CLI, allowing you to query, filter, and manipulate streams using SQL-like syntax.
* **Schema Management**: Integrates with Schema Registry for managing Avro, Protobuf, or JSON schemas when strict data contracts are required.
* **Ease of Testing**: Scripts support environment provisioning, cleanup, and test data seeding, while AKHQ and ksqlDB provide visibility of topics and streams.

The goal is to keep it useful, simple, clean, and easy to run.

## Quickstart

TODO

## Table of Contents
* [Reusable Local Environment](#reusable-local-environment)
* [Apache Kafka in Data Engineering](#apache-kafka-in-data-engineering)
* [Technology Stack](#technology-stack)
* [Deployment](#deployment)
* [Seeding Test Data](#seeding-test-data)
* [Monitoring and Management via AKHQ](#monitoring-and-management-via-akhq)
* [Managing Topics and Messages via CLI](#managing-topics-and-messages-via-cli)
* [Schema Registry for Data Contracts](#schema-registry-for-data-contracts)
* [SQL-Based Stream Processing with ksqlDB](#sql-based-stream-processing-with-ksqldb)
* [Stop and Cleanup](#stop-and-cleanup)
* [Additional Resources](#additional-resources)
* [Author](#author)
* [Disclaimer](#disclaimer)

## Disclaimer

THIS SOFTWARE AND ANY DOCUMENTATION INCLUDED IN THIS REPOSITORY AND CREATED BY THE AUTHOR
(INCLUDING, BUT NOT LIMITED TO, THE README.MD FILE) ARE PROVIDED FOR EDUCATIONAL PURPOSES ONLY.

THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE,
THE DOCUMENTATION, OR THE USE OR OTHER DEALINGS IN THE SOFTWARE OR DOCUMENTATION.

THIRD-PARTY LIBRARIES REFERENCED OR INCLUDED IN THIS SOFTWARE ARE SUBJECT TO THEIR OWN LICENSES.
THIRD-PARTY DOCUMENTATION OR EXTERNAL RESOURCES REFERENCED IN THIS REPOSITORY ARE SUBJECT TO THEIR OWN LICENSES AND TERMS.

Apache Kafka is a trademark of the Apache Software Foundation. Docker is a trademark or registered trademark of Docker, Inc.
ksqlDB is trademark of Confluent, Inc. AKHQ, Schema Registry and other names may be trademarks of their respective owners.