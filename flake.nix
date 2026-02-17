{
  description = "Dante nixos config";

  outputs = { self }: {
    templates = {

      c = {
        path = ./templates/c;
        description = "C development shell with gcc";
      };

      java = {
        path = ./templates/java;
        description = "Java dev shell with JDK21";
      };

      fullstack = {
        path = ./templates/fullstack;
        description = "Fullstack dev shell witch C#, Python & React";
      };
			
			react-supabase = {
				path = ./templates/react-supabase;
				description = "Fullstack dev shell with React, Supabase, TanStack & Zustand";
			};

			peluqueria = {
				path = ./templates/peluqueria;
				description = "Fullstack dev shell with React, python & SQL";
			};
    };
  };
}
