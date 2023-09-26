package ua.cbd;

/**
 * Hello world!
 *
 */
import redis.clients.jedis.Jedis;

public class ex13a {
    public static void main(String[] args) {
        // Ensure you have redis-server running
        Jedis jedis = new Jedis();
        jedis.set("mykey", "smth");
        System.out.println(jedis.get("mykey"));
        jedis.del("mykey");
        System.out.println(jedis.get("mykey"));
        jedis.set("mykey", "33");
        jedis.rename("mykey", "mynewkey");
        jedis.incr("mynewkey");
        System.out.println(jedis.get("mynewkey"));
        System.out.println(jedis.ping());
        System.out.println(jedis.type("mynewkey"));
        //System.out.println(jedis.info());
        jedis.close();
    }
}
