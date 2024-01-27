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
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.InsertOneResult;
import com.mongodb.client.result.UpdateResult;

public class Querys_java {
        public static void main(String[] args) {
            String uri = "mongodb://localhost:27017";
        

            try (MongoClient mongoClient = MongoClients.create(uri)) {
                MongoDatabase database = mongoClient.getDatabase("rest");
                MongoCollection<Document> collection = database.getCollection("restaurants");

                //c

                /* /1

                MongoCursor<Document> cursor = collection.find().iterator();
                try {
                    while (cursor.hasNext()) {
                        Document doc_all = cursor.next();
                        System.out.println(doc_all.toJson());
                    }
                } finally {
                    cursor.close();
                }


                //5

                MongoCursor<Document> cursor_2 = collection.find(Filters.eq("localidade", "Bronx")).sort(Sorts.ascending("name")).iterator();
                int n = 0;
                try {
                    while (cursor_2.hasNext() && n < 15) {
                        Document doc_all = cursor_2.next();
                        System.out.println(n + 1 + "º");
                        System.out.println(doc_all.toJson());
                        n++;
                    }
                } finally {
                    cursor_2.close();
                }

                //7

                Bson filter_1 = Filters.elemMatch("grades", Filters.and(Filters.gte("score", 80),Filters.lte("score", 100)));

                MongoCursor<Document> cursor_3 = collection.find(filter_1).iterator();
                try {
                    while (cursor_3.hasNext() ) {
                        Document doc_all = cursor_3.next();
                        
                        System.out.println(doc_all.toJson());
                    }
                } finally {
                    cursor_3.close();
                }

                //10

                Bson filter_2 = Filters.regex("nome", "^Wil");

                MongoCursor<Document> cursor_4 = collection.find(filter_2).projection(Projections.fields(Projections.include("restaurant_id", "nome", "localidade", "gastronomia"),Projections.excludeId())).iterator();

                try {
                    while (cursor_4.hasNext() ) {
                        Document doc_all = cursor_4.next();
                        
                        System.out.println(doc_all.toJson());
                    }
                } finally {
                    cursor_4.close();
                } */

                //14

                Document dateFilter = new Document("$date", "2014-08-11T00:00:00Z");

                Bson filter_3 =  Filters.elemMatch("grades", Filters.and(Filters.eq("grade", "A"), Filters.eq("score", 10)));//, Filters.elemMatch("date", Filters.eq("$date", "2014-08-11T00:00:00Z")))); n da nsei pq

                MongoCursor<Document> cursor_5 = collection.find(filter_3).projection(Projections.fields(Projections.include("nome", "grades"))).iterator();

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

