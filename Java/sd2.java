import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class sd2
{
	final static int ITERATIONS = 100;
	final static int THREADS = 4;
	static ArrayList<ModulusStrategy> modulos;
	static int[] factors = {3, 5, 15};
	
	public static void main(String[] args)
	{
		int i = 0;
		createModulos();
		
		int chunkSize = ITERATIONS / THREADS;
		
		ExecutorService executor = Executors.newFixedThreadPool(THREADS);
		ArrayList<Future<Map<Integer, Match>>> results = new ArrayList<Future<Map<Integer, Match>>>();
		HashMap<Integer, Match> combinedResults = new HashMap<Integer, Match>();
		
		do
		{
			results.add(executor.submit(new Worker(modulos, chunkSize * i, clamp(chunkSize * (i + 1), ITERATIONS))));
			i = i + 1 ;
		}
		while(i <= THREADS);
		
		i = 0;
		
		do
		{
			try
			{
				combinedResults.putAll(results.get(i).get());
			} catch (Exception e)
			{
				System.out.println("Something went wrong :^)");
			}
			i = i + 1 ;
		}
		while(i <= THREADS);
		
		i = 0;
		
		do
		{
			if(combinedResults.get(i) == Match.NONE)
			{
				System.out.println(i);
			}
			else
			{
				System.out.println(combinedResults.get(i).toString());
			}	
			i = i + 1 ;
		}
		while(i <= ITERATIONS);
		
		executor.shutdown();
	}

	public static void createModulos()
	{	
		int k = factors.length - 1;
		modulos = new ArrayList<ModulusStrategy>();
		ModulusFactory factory = new ModulusFactory();
		
		do
		{
			modulos.add(factory.buildModulusStrategy(factors[k]));
			k = k - 1;
		}
		while(k >= 0);
	}
	
	public static int clamp(int val, int max)
	{
		if(val > max)
			val = max;
		
		return val;
	}
}

enum Match
{
	NONE,
	FIZZ,
	BUZZ,
	FIZZBUZZ,
}

class Worker implements Callable<Map<Integer, Match>>
{
	ArrayList<ModulusStrategy> modulos;
	int start;
	int finish;
	
	public Worker(ArrayList<ModulusStrategy> modulos, int start, int finish)
	{
		this.modulos = modulos;
		this.start = start;
		this.finish = finish;
	}
	
	public HashMap<Integer, Match> call() throws Exception
	{
		int i = this.start;
		HashMap<Integer, Match> results = new HashMap<Integer, Match>();
		
		do
		{
			int j = 0;
			Match result;
			
			do
			{
				result = this.modulos.get(j).process(i);
				
				if(result != Match.NONE)
					break;
				
				j = j + 1;
			}
			while(j < this.modulos.size());
			
			results.put(i, result);
			
			i = i + 1;
		}
		while(i <= this.finish);
		
		return results;
	}
}

class ModulusFactory
{
	ModulusFactory(){}
	
	public ModulusStrategy buildModulusStrategy(int factor)
	{
		if(factor == 3)
		{
			return new ModulusStrategy(factor, Match.FIZZ);
		}
		else if(factor == 5)
		{
			return new ModulusStrategy(factor, Match.BUZZ);
		}
		else if(factor == 15)
		{
			return new ModulusStrategy(factor, Match.FIZZBUZZ);
		}
		else
		{
			throw new IllegalArgumentException("That's not how you play Fizzbuzz");
		}
	}
}

class ModulusStrategy
{
	private int factor;
	private Match match;
	
	public ModulusStrategy(int factor, Match type)
	{
		this.factor = factor;
		this.match = type;
	}
	
	public Match process(int x)
	{
		if(isFactor(x))
		{
			return this.match;
		}
		
		return Match.NONE;
	}
	
	public boolean isFactor(int x)
	{
		if(x < this.factor)
		{
			return false;
		}
		else if(x > this.factor)
		{
			return this.isFactor(x - factor);
		}
		
		return true;
	}
}
