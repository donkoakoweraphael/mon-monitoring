import time
import psutil
import os
from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS

# Configuration de psutil pour lire /proc de l'hôte si monté
if os.path.exists('/host/proc'):
    psutil.PROCFS_PATH = '/host/proc'

# Configuration via variables d'environnement (définies dans docker-compose)
bucket = os.getenv("DOCKER_INFLUXDB_INIT_BUCKET", "mon_bucket")
org = os.getenv("DOCKER_INFLUXDB_INIT_ORG", "mon_org")
token = os.getenv("DOCKER_INFLUXDB_INIT_ADMIN_TOKEN", "mon_super_token")
url = "http://influxdb:8086"

client = InfluxDBClient(url=url, token=token, org=org)
write_api = client.write_api(write_options=SYNCHRONOUS)

print("Monitoring démarré...", flush=True)

while True:
    # 1. Récupération des métriques
    cpu_usage = psutil.cpu_percent(interval=1)
    ram_usage = psutil.virtual_memory().percent
    disk_usage = psutil.disk_usage('/').percent

    # 2. Préparation du point de donnée
    point = (
        Point("system_metrics")
        .field("cpu", cpu_usage)
        .field("ram", ram_usage)
        .field("disk", disk_usage)
    )

    # 3. Envoi vers InfluxDB
    try:
        write_api.write(bucket=bucket, org=org, record=point)
        print(f"Envoyé: CPU={cpu_usage}%, RAM={ram_usage}%, DISK={disk_usage}%", flush=True)
    except Exception as e:
        print(f"Erreur d'envoi: {e}", flush=True)

    time.sleep(5)