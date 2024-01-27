package ex_3_3.src;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.Statement;
import com.datastax.driver.core.querybuilder.QueryBuilder;

import static com.datastax.driver.core.querybuilder.QueryBuilder.*;

public class App {
    public static void main(String[] args) throws Exception {
        Cluster cluster = Cluster.builder().addContactPoint("127.0.0.1").build();
        Session session = cluster.connect();

        //keyspace
        session.execute("USE Video_share;");

        System.out.println("A)");

        //insert
        Statement insertStatement = insertInto("users")
            .value("id", 9999)
            .value("uname", "user21")
            .value("name", "random user")
            .value("email", "user21@ex3_2.com")
            .value("timestamp", fcall("toTimeStamp", fcall("now")));

        if(session.execute(insertStatement)==null){
            System.out.println("Failed to insert");
        }else{
            System.out.println("Insert successful");
        } 

        //edit data
        Statement updateStatement = update("users")
            .with(set("email", "user@ex3_2.com"))
            .where(eq("uname", "user21"))
            .and(eq("id", 9999));

        if(session.execute(updateStatement)==null){
            System.out.println("Update failed");
        }else{
            System.out.println("Update successful");
        } 

        //search

        //All the users
        System.out.println("All the users:");
        Statement select = select().all().from("users");
        System.out.println(session.execute(select).all());

        //user with username user21
        System.out.println("User user21:");
        Statement select1 = select().all().from("users").where(eq("uname", "user21"));
        System.out.println(session.execute(select1).all());


        System.out.println("B)");

        System.out.println("Query 1:");
        //3.2 a) (8)
        Statement selectq1 = select().all().from("comments").where(eq("auth_id", 1));
        //String selectq1 = "SELECT * FROM comments WHERE auth_id = 1;";
        System.out.println(session.execute(selectq1).all());


        System.out.println("Query 2:");
        //3.2 d) (5)
        Statement selectq2 = select().all().from("videos").where(eq("auth_id", 1)).and(gt("add_date", "2023-04-30")).and(lt("add_date", "2023-05-31"));
        //String selectq2 = "SELECT * FROM videos WHERE auth_id = 1 and add_date > '2023-04-30' and add_date < '2023-05-31';";
        System.out.println(session.execute(selectq2).all());

        System.out.println("Query 3:");
        //3.2 d) (3)
        Statement selectq3 = select().all().from("videos").where(contains("tag", "tag1"));
        //String selectq3 = "SELECT * FROM videos WHERE tag CONTAINS 'tag1';";
        System.out.println(session.execute(selectq3).all());

        System.out.println("Query 4:");
        //3.2 d) (2)
        Statement selectq4 = select().column("tag").from("videos").where(eq("auth_id", 1)).and(eq("id", 1));
        //String selectq4 = "SELECT tag FROM videos WHERE auth_id = 1 and id = 1;";
        System.out.println(session.execute(selectq4).all()); 

        session.close();
        cluster.close();

    }
}