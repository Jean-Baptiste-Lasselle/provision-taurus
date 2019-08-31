# Provision a containerized taurus.org

```bash 
export URI_REPO_GIT=https://github.com/Jean-Baptiste-Lasselle/provision-taurus.git
mkdir some-taurus/
cd some-taurus/
git clone "$URI_REPO_GIT" .
chmod +x ./operations.sh
./operations.sh
```



# Milestones

On va faire exactement la topologie  décrite dans https://github.com/Jean-Baptiste-Lasselle/provision-taurus/blob/master/taurus-bzt-config/local/jmeter/printable_docs/usermanual/jmeter_distributed_testing_step_by_step.pdf, mais avec 2 `docker-compose.yml`, et 4 réseaux docker :

* premier  `docker-compose.yml` : c'est le système distribué qui exécute et orchestre les tests, avec 7 instances distinctes de jmeter en cluster. On remplacera httpd / mod_cluster par tarefik pour le load balancing entre les membres du cluster. https://github.com/Jean-Baptiste-Lasselle/provision-taurus/blob/master/taurus-bzt-config/local/jmeter/printable_docs/usermanual/jmeter_distributed_testing_step_by_step.pdf
* second  `docker-compose.yml` : il représente le system testé (_"system under test"_). Pour la plupart des applications, un docker-compose est un raffinement suffisant d'envionnement d'une première série de test de scale out, avec `docker-compose scale mon-microservice=23`. C'est unpassage de palier de tests intermédiaire, après lequel on passe ensuite à un process [`kompose`](https://github.com/kubernetes/kompose), de "transformation" en déploiement _Kubernetes_.

En l'état, il suffit de changer la ligne `http://localhost` dans le fichier `taurus-bzt-config/config.yml`, pour obtenir un run d'un test de charge JMeter basique, sur le site web en question. 

Voici par exemple une session de test sen cours, sur https://docs.traefik.io : 

[impr. ecran exemple exécution de tests charge jmeter sur https-docs.traefik.io](https://github.com/Jean-Baptiste-Lasselle/provision-taurus/raw/master/docueemntation/impr-ecrans/TAURUS_JMETER_TESTING_2019-08-31%2015-55-55.png) 
