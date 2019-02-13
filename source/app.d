import vibe.d;



shared static this()
{
	auto router = new URLRouter;
	router.get("/", staticTemplate!"home.dt");
	router.get("/iron-triangle", staticTemplate!"iron-triangle.dt");
	router.get("/linkage-institutions", staticTemplate!"linkage-institutions.dt");
	router.get("/think-tanks", staticTemplate!"think-tanks.dt");
	router.get("/revolving-door", staticTemplate!"revolving-door.dt");
	router.get("/pacs", staticTemplate!"pacs.dt");
	router.get("/quiz", staticTemplate!"quiz.dt");

	router.get("*", serveStaticFiles("public/"));

	auto settings = new HTTPServerSettings;
	settings.port = 9069;
	settings.bindAddresses = ["::1", "0.0.0.0"];

	listenHTTP(settings, router);
}