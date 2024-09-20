### Elasticsearch Commands

##### How to importing models inside elasticsearch indexes
```shell
 docker-compose run app rails environment elasticsearch:import model=category batch_size=1
```

- **model** Which model is your model name in downcase
- **batch_size** Which is the size of batch which will imported inside elasticsearch at once 