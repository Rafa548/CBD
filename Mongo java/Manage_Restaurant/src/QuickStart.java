import static com.mongodb.client.model.Filters.eq;

import java.util.Arrays;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Sorts;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.InsertOneResult;
import com.mongodb.client.result.UpdateResult;

public class QuickStart {
    public static void main( String[] args ) {

        // Replace the placeholder with your MongoDB deployment's connection string
        String uri = "mongodb://localhost:27017";
        

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("rest");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            try {
                InsertOneResult result = collection.insertOne(new Document()
                        .append("_id", new ObjectId())
                        .append("name", "Ski Bloopers")
                        .append("genres", Arrays.asList("Documentary", "Comedy")));
                System.out.println("Success! Inserted document id: " + result.getInsertedId());
            } catch (MongoException me) {
                System.err.println("Unable to insert due to an error: " + me);
            }

            Document doc = collection.find(eq("name", "Ski Bloopers")).first();
            if (doc != null) {
                System.out.println(doc.toJson());
            } else {
                System.out.println("No matching documents found.");
            }

            Document query = new Document().append("name",  "Ski Bloopers");    //choose target document
            
            Bson updates = Updates.combine(                             //add runtime, genre, and lastUpdated fields
                    Updates.set("runtime", 99),
                    Updates.addToSet("genres", "Sports"),
                    Updates.currentTimestamp("lastUpdated"));

            UpdateOptions options = new UpdateOptions().upsert(true);       
            try {
                UpdateResult result = collection.updateOne(query, updates, options);
                System.out.println("Modified document count: " + result.getModifiedCount());
                System.out.println("Upserted id: " + result.getUpsertedId()); 
            } catch (MongoException me) {
                System.err.println("Unable to update due to an error: " + me);
            }

            Document doc_2 = collection.find(eq("name", "Ski Bloopers")).first(); //check if update was done
            if (doc_2 != null) {
                System.out.println(doc_2.toJson());
            } else {
                System.out.println("No matching documents found.");
            }


            Bson query_2 = eq("name", "Ski Bloopers");
            try {
                DeleteResult result = collection.deleteOne(query_2);
                System.out.println("Deleted document count: " + result.getDeletedCount());
            } catch (MongoException me) {
                System.err.println("Unable to delete due to an error: " + me);
            }

            Document doc_3 = collection.find(eq("name", "Ski Bloopers")).first(); //it deleted it
            if (doc_3 != null) {
                System.out.println(doc_3.toJson());
            } else {
                System.out.println("No matching documents found.");
            }

            //c

            //1
            /* MongoCursor<Document> cursor = collection.find().iterator();
            try {
                while (cursor.hasNext()) {
                    Document doc_all = cursor.next();
                    System.out.println(doc_all.toJson());
                }
            } finally {
                cursor.close();
            } */


            //5

            /* MongoCursor<Document> cursor_5 = collection.find(eq("localidade", "Bronx")).sort(Sorts.ascending("name")).iterator();
            int n = 0;
            try {
                while (cursor_5.hasNext() && n < 15) {
                    Document doc_all = cursor_5.next();
                    System.out.println(n + 1 + "º");
                    System.out.println(doc_all.toJson());
                    n++;
                }
            } finally {
                cursor_5.close();
            } */

            //7

            /* Bson filter = Filters.elemMatch("grades", Filters.and(Filters.gte("score", 80),Filters.lte("score", 100)));

            MongoCursor<Document> cursor_5 = collection.find(filter).iterator();
            try {
                while (cursor_5.hasNext() ) {
                    Document doc_all = cursor_5.next();
                    
                    System.out.println(doc_all.toJson());
                }
            } finally {
                cursor_5.close();
            } */

            //10

            /* Bson filter = Filters.regex("nome", "^Wil");

            MongoCursor<Document> cursor_5 = collection.find(filter).projection(Projections.fields(Projections.include("restaurant_id", "nome", "localidade", "gastronomia"),Projections.excludeId())).iterator();

            try {
                while (cursor_5.hasNext() ) {
                    Document doc_all = cursor_5.next();
                    
                    System.out.println(doc_all.toJson());
                }
            } finally {
                cursor_5.close();
            } */

            //14

            Bson filter =  Filters.elemMatch("grades", Filters.and(Filters.eq("grade", "A"), Filters.eq("score", 10))); //, Filters.eq("date", "2014-08-11T00:00:00Z"))); not working

            MongoCursor<Document> cursor_5 = collection.find(filter).projection(Projections.fields(Projections.include("nome", "grades"))).iterator();

            try {
                while (cursor_5.hasNext() ) {
                    Document doc_all = cursor_5.next();
                    
                    System.out.println(doc_all.toJson());
                }
            } finally {
                cursor_5.close();
            }

            mongoClient.close();
            
        }
    }
}