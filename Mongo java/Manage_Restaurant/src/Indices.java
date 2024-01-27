
import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class Indices {
    public static void main(String[] args) {
        String uri = "mongodb://localhost:27017";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("rest");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            long startTime_1_1 = System.currentTimeMillis();
            Document localQuery = new Document("localidade", "Queens"); // Realizar pesquisa com índice de localidade
            collection.find(localQuery).forEach(restaurant -> {
                System.out.println(restaurant);
            });
            long endTime_1_1 = System.currentTimeMillis();

            long startTime_2_2 = System.currentTimeMillis();
            Document gastQuery = new Document("gastronomia", "American");
            collection.find(gastQuery).forEach(restaurant -> {
                System.out.println(restaurant);
            });
            long endTime_2_2 = System.currentTimeMillis();

            long startTime_3_3 = System.currentTimeMillis();
            Document textQuery = new Document("$text", new Document("$search", "Astoria Boulevard"));   //aqui igual
            collection.find(textQuery).forEach(restaurant -> {
                System.out.println(restaurant);
            });
            long endTime_3_3 = System.currentTimeMillis();

            
            collection.createIndex(new Document("localidade", 1)); // Criar índice para localidade
            collection.createIndex(new Document("gastronomia", 1)); 
            collection.createIndex(new Document("nome", "text"));   //text é especial no mongo para pesquisa mais eficiente

            
            long startTime_1 = System.currentTimeMillis();
            collection.find(localQuery).forEach(restaurant -> {
                System.out.println(restaurant);
            });
            long endTime_1 = System.currentTimeMillis();
            
            long startTime_2 = System.currentTimeMillis();
            collection.find(gastQuery).forEach(restaurant -> {
                System.out.println(restaurant);
            });
            long endTime_2 = System.currentTimeMillis();
            

            long startTime_3 = System.currentTimeMillis();
            collection.find(textQuery).forEach(restaurant -> {
                System.out.println(restaurant);
            });
            long endTime_3 = System.currentTimeMillis();

            System.out.println("Sem índice: ");

            System.out.println("Tempo para consulta de localidade: " + (endTime_1_1 - startTime_1_1) + " ms");
            System.out.println("Tempo para consulta de gastronomia: " + (endTime_2_2 - startTime_2_2) + " ms");
            System.out.println("Tempo para consulta de texto: " + (endTime_3_3 - startTime_3_3) + " ms");


            System.out.println("Com índice: ");
            System.out.println("Tempo para consulta de localidade: " + (endTime_1 - startTime_1) + " ms");
            System.out.println("Tempo para consulta de gastronomia: " + (endTime_2 - startTime_2) + " ms");
            System.out.println("Tempo para consulta de texto: " + (endTime_3 - startTime_3) + " ms");
            mongoClient.close();
        }
    }
}


