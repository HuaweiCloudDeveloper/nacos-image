<p align="center">
  <h1 align="center">Nginx Gateway</h1>
  <p align="center">
    <a href="README_zh.md"><strong>简体中文</strong></a> | <strong>English</strong>
  </p>
</p>

## Table of Contents

- [Repository Introduction](#repository-introduction)
- [Prerequisites](#prerequisites)
- [Image Specifications](#image-specifications)
- [Getting Help](#getting-help)
- [How to Contribute](#how-to-contribute)

## Repository Introduction
[Nginx](https://github.com/nginx/nginx) **Nginx** is a high-performance HTTP and reverse proxy server, lightweight and capable of handling high concurrency, enabling stable and efficient web services.

**Core Features of Nginx:**

Nginx's core features can be summarized into six key aspects:

**1. Event-Driven Architecture**

• Uses asynchronous non-blocking I/O model (epoll/kqueue)

• A single thread can handle tens of thousands of concurrent connections

• Extremely low resource consumption (minimal CPU/memory usage)

**2. High-Performance Proxy**

• Supports HTTP/HTTPS/TCP/UDP reverse proxy

• Load balancing algorithms (round-robin/weighted/IP hash, etc.)

• Dynamic service discovery integration

**3. Traffic Management**

• Request rate limiting (leaky bucket algorithm)

• Concurrent connection control

• Intelligent traffic routing and circuit breaking

**4. Extensible Architecture**

• Modular design (official/third-party modules)

• Supports Lua scripting (OpenResty)

• Hot upgrade mechanism (zero-downtime updates)

**5. Web Service Optimization**

• Efficient static file handling (zero-copy technology)

• Supports HTTP/2, WebSocket

• Gzip compression and cache control

**6. High Reliability**

• Master-slave multi-process architecture

• Health checks and automatic failover

• Proven stability (used by 41.6% of top 1M global websites)

**These features make Nginx a core component of modern web architectures, processing trillions of requests daily and serving as critical infrastructure for cloud computing/CDN/microservices.**

This project provides an open-source image product [**`Nginx-Monitoring and Alerting Tool`**](https://marketplace.huaweicloud.com/hidden/contents/63cb0a15-4197-479c-8c24-8ef3c281276f#productid=OFFI1154255073536368640), pre-installed with Nginx and its runtime environment, along with deployment templates. Follow the user guide to enjoy an efficient "out-of-the-box" experience.

**Architecture Design:**

![](./img.jpeg)

> **System Requirements:**
> - CPU: 2 vCPUs or higher
> - RAM: 4GB or more
> - Disk: At least 50GB

## Prerequisites
[Register a Huawei account and activate Huawei Cloud](https://support.huaweicloud.com/usermanual-account/account_id_001.html)

## Image Specifications

| Image Specification                                                                                                                                              | Features | Notes |
|---------------------------------------------------------------------------------------------------------------------------------------------------| --- | --- |
| [Nginx2.3.0-arm-v1.0](https://marketplace.huaweicloud.com/hidden/contents/63cb0a15-4197-479c-8c24-8ef3c281276f#productid=OFFI1154255073536368640) | Deployed on Kunpeng servers + Huawei Cloud EulerOS 2.0 64bit |  |

## Getting Help
- For more questions, contact us via [issue](https://github.com/HuaweiCloudDeveloper/nginx-image/issues) or Huawei Cloud Marketplace support for the specified product
- Other open-source images can be found at [open-source-image-repos](https://github.com/HuaweiCloudDeveloper/open-source-image-repos)

## How to Contribute
- Fork this repository and submit merge requests
- Synchronize updates to README.md based on your open-source image information