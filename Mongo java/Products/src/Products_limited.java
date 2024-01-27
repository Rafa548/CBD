import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Products_limited {
    public static void main(String[] args) {
        int time_limit = 10;
        int unit_limit = 30;
        String uri = "mongodb://localhost:27017";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            Scanner sc_in = new Scanner(System.in);
            MongoDatabase database = mongoClient.getDatabase("product_limited");
            MongoCollection<Document> collection = database.getCollection("users");

            System.out.print("Username: ");
            String username = sc_in.nextLine();

            int unitsBought = 0;
            long startTime = System.currentTimeMillis();
            Document user = collection.find(new Document("username", username)).first();

            if (user == null) {
                startTime = System.currentTimeMillis();

                Map<String, Integer> products = new HashMap<>();
                collection.insertOne(new Document("username", username)
                        .append("time", startTime)
                        .append("products", products));
                user = collection.find(new Document("username", username)).first();
            }

            while (!username.equals("")) {
                System.out.printf("Buying products ('Enter' to quit) (%d/%d) : ", unitsBought, unit_limit);
                String product = sc_in.nextLine();
                
                if (!product.isEmpty()) {
                    long currentTime = System.currentTimeMillis();
                    long elapsedTime = currentTime - startTime;
                    Map<String, Integer> products = user.get("products", Map.class);

                    if (elapsedTime <= time_limit * 1000) {
                        unitsBought = products.getOrDefault(product, 0);
                        //System.out.println("unitsBought: " + unitsBought);
                        if (unitsBought < unit_limit) {
                            products.put(product, unitsBought + 1);
                            unitsBought = products.getOrDefault(product, 0);
                            user.put("products", products);
                            collection.replaceOne(new Document("username", username), user);
                        } else {
                            //System.out.println(collection.find(new Document("username", username)).first());
                            System.out.println("No more units available for this product.");
                        }
                    } else {
                        System.out.println("User quota reseted");
                        startTime = currentTime;
                        products.clear();
                        products.put(product, 1);
                        user.put("time", startTime);
                        user.put("products", products);
                        collection.replaceOne(new Document("username", username), user);
                    }
                } else {
                    System.out.print("Username: ");
                    username = sc_in.nextLine();
                    user = collection.find(new Document("username", username)).first();
                    
                    if (user == null) {
                        startTime = System.currentTimeMillis();
                        Map<String, Integer> products = new HashMap<>();
                        collection.insertOne(new Document("username", username)
                                .append("time", startTime)
                                .append("products", products));
                        user = collection.find(new Document("username", username)).first();
                    }
                    else {
                        unitsBought = user.get("products", Map.class).size();
                        startTime = user.getLong("time");
                    }
                }
            }

            mongoClient.close();
            sc_in.close();
        }
    }
}
