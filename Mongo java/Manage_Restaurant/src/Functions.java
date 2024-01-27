import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.mongodb.client.DistinctIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Functions {
    public static void main(String[] args) {
        String uri = "mongodb://localhost:27017";
        Map<String, Integer> map = new HashMap<String, Integer>();
        

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("rest");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            
            System.out.println("Numero de localidades distintas : " + countLocalidades(collection));

            map = countRestByLocalidade(collection);
            System.out.println("Numero de restaurantes por localidade: ");
            for (String localidade : map.keySet()) {
                System.out.println("->: " + localidade + " - " + map.get(localidade));
            }

            String s_name = "Park";
            System.out.println("Nome de restaurantes contendo "+ s_name + " no nome: ");
            List<String> matchingRestaurants = getRestWithNameCloserTo(collection, s_name);

            for (String restaurantName : matchingRestaurants) {
                System.out.println("-> " + restaurantName);
            }
            mongoClient.close();
        }
        
    }

    /* public  static int countLocalidades(MongoCollection<Document> collection){
        DistinctIterable<String> distinctLocalidades = collection.distinct("localidade", String.class);   
        return distinctLocalidades.into(new ArrayList<String>()).size();
    } */

                            //or

    public static int countLocalidades(MongoCollection<Document> collection){
        int count = 0;
        List<String> localidades = new ArrayList<String>();
        for (Document doc : collection.find()) {
            String localidade = doc.getString("localidade");
            if(!localidades.contains(localidade)){
                localidades.add(localidade);
                count++;
            }
            
        }
        return count;

    }


    public static Map<String, Integer> countRestByLocalidade(MongoCollection<Document> collection) {

        Map<String, Integer> map = new HashMap<String, Integer>();
        List<String> localidades = new ArrayList<String>();
        for (Document doc : collection.find()) {
            String localidade = doc.getString("localidade");
            if(!localidades.contains(localidade)){
                localidades.add(localidade);
            }
            
        }  

        for (String localidade : localidades) {
            long count = collection.countDocuments(new Document("localidade", localidade));
            map.put(localidade, (int) count);
        }
        return map;
    }

    public static List<String> getRestWithNameCloserTo(MongoCollection<Document> collection, String name) {
        List<String> M_Restaurants = new ArrayList<>();

        Document filter = new Document("nome", new Document("$regex", name).append("$options", "i")); //.append("$options", "i") -> case insensitive

        FindIterable<Document> results = collection.find(filter);
        //System.out.println(results);

        for (Document doc : results) {
            //System.out.println(doc);
            String rest_n = doc.getString("nome");
            M_Restaurants.add(rest_n);
        }

        return M_Restaurants;

    }
    
    
}
