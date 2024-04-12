<h1 align="center"><div align="center">

<img src="docs/src/assets/logo.png" align="center" width="200px" height="194px"/>

### K3s cluster

... managed using Ansible, Flux and Renovate

</div>
</h1>

<div align="center">

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge&logo-pre-commit)](https://github.com/pre-commit/pre-commit "
Precommit status")

</div>


<div align="center">

[![Age-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_age_days&style=flat-square&label=Age)](https://github.com/kashalls/kromgo/)
&nbsp;
[![Uptime-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_uptime_days&style=flat-square&label=Uptime)](https://github.com/kashalls/kromgo/)
&nbsp;
[![Active-Alerts](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fmetric%3Dprometheus_active_alerts&style=flat-square&label=Firing%20Alerts)](https://grafana.k3s.alexsaphir.com/alerting/list?search=state:firing)
&nbsp;
[![Node-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_node_count&style=flat-square&label=Nodes)](https://github.com/kashalls/kromgo/)
&nbsp;
[![Pod-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_pod_count&style=flat-square&label=Pods)](https://github.com/kashalls/kromgo/)
&nbsp;
[![CPU-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_cpu_usage&style=flat-square&label=CPU)](https://github.com/kashalls/kromgo/)
&nbsp;
[![Memory-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.k3s.alexsaphir.com%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_memory_usage&style=flat-square&label=Memory)](https://github.com/kashalls/kromgo/)

</div>


---

## 📖 Overview

---

## ⛵ Kubernetes

---

## Repository Structure

```
📁 cluster  
├── 📁 apps           # applications
├── 📁 bootstrap      # bootstrap procedures
├── 📁 flux           # core flux configuration
└── 📁 infra          # network, storage, ...
```

---

## 🔧 Hardware

| Device           | Count | OS Disk Size | Data Disk Size | RAM  | Operating System | IP           | Purpose            |
|------------------|-------|--------------|----------------|------|------------------|--------------|--------------------|
| Minisforum U820  | 1     | 1TB NVMe     | 2TB SSD        | 64GB | Ubuntu 22.10     | 192.168.0.56 |                    |
| N6005/4x2.5G     | 1     | 256GB NVMe   |                | 8GB  | VyOS             |              | Router             |
| Minisforum U820  | 1     | 1TB NVMe     | 1TB SSD        | 16GB | Ubuntu 22.10     | 192.168.0.70 | Kubernetes Control |
| Minisforum U820  | 1     | 1TB NVMe     | 1TB SSD        | 16GB | Ubuntu 22.10     | 192.168.0.71 | Kubernetes Worker  |
| QNAP QSW-1105-5T | 1     | -            | -              | -    | -                | -            | 2.5Gb Switch       |

---

## Gratitude and Thanks

Thanks to all the people who donate their time to the [Home Operations](https://discord.gg/home-operations) Discord
community. Be sure to check out [kubesearch.dev](https://kubesearch.dev/) for ideas on how to deploy applications or get
ideas on what you may deploy.
