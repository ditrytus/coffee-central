#!/usr/bin/env dotnet-script
#r "nuget: Newtonsoft.Json, 12.0.2"

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

if (Args.Count != 2)
{
    throw new ArgumentException("Exprected 2 arguments.");
}

using (var reader = File.OpenText(Args[0]))
using (var writer = new StreamWriter(File.OpenWrite(Args[1])))
{
    var root = (JObject)JToken.ReadFrom(new JsonTextReader(reader));

    var tableName = "Sprites";

    writer.WriteLine("require(\"sprite\")");
    writer.WriteLine();

    var groupedFrames = new Dictionary<string, object>();
    foreach(var frame in (JArray)root["frames"])
    {
        var pathSegments = ((string)frame["filename"]).Split("/");
        var groupNode = groupedFrames;
        for (int i = 0; i < pathSegments.Length; i++)
        {
            var segment = pathSegments[i];
            
            if (i == pathSegments.Length - 1)
            {
                groupNode.Add(segment, (JObject)frame);
                break;
            }

            if (!groupNode.ContainsKey(segment))
            {
                groupNode.Add(segment, new Dictionary<string, object>());
            }

            groupNode = (Dictionary<string, object>)groupNode[segment];
        }
    }

    var prefix = tableName;
    
    void Foo(string prefix, Dictionary<string, object> group)
    {
        writer.WriteLine($"{prefix} = {{}}");
        foreach (var keyval in group)
        {
            var assignable = $"{prefix}[\"{keyval.Key}\"]";
            switch(keyval.Value)
            {
                case JObject frame:
                    var frameRect = frame["frame"];
                    writer.WriteLine($"{assignable} = Sprite:new(Rectangle:new({frameRect["x"]}, {frameRect["y"]}, {frameRect["w"]}, {frameRect["h"]}), black)");
                    break;
                case Dictionary<string, object> subGroup:
                    Foo(assignable, subGroup);
                    break;
                default:
                    throw new InvalidOperationException($"Type {keyval.Value.GetType().FullName} was not expected.");
            }
        }
    }

    Foo(tableName, groupedFrames);
}
