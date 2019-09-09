#!/usr/bin/env dotnet-script
#r "nuget: Newtonsoft.Json, 12.0.2"

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

if (Args.Count != 2)
{
    throw new ArgumentException("Exprected 2 arguments.");
}

using (var reader = File.OpenText(Args[0]))
using (var writer = File.CreateText(Args[1]))
{
    var root = (JObject)JToken.ReadFrom(new JsonTextReader(reader));

    var tableName = "spritesheet";

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
    
    void GenerateLua(int indentLevel, string variableName, object node, bool isLast)
    {
        var indent = new String(' ', indentLevel);
        writer.Write(indent);
        if (!string.IsNullOrEmpty(variableName))
        {
            writer.Write($"{variableName} = ");
        }
        switch(node)
        {
            case JObject frame:
                var frameRect = frame["frame"];
                writer.Write($"{{x={frameRect["x"]}, y={frameRect["y"]}, w={frameRect["w"]}, h={frameRect["h"]}}}");
                break;
            case Dictionary<string, object> group:
                writer.WriteLine($"{{");
                var isArray = group.Values.All(v => v is JObject);
                for (int i = 0; i < group.Count; i++)
                {
                    var keyval = group.ElementAt(i);
                    GenerateLua(indentLevel + 1, isArray ? string.Empty : keyval.Key, keyval.Value, i == group.Count - 1);
                }
                writer.Write($"{indent}}}");
                break;
            default:
                throw new InvalidOperationException($"Type {node.GetType().FullName} was not expected.");
        }
        writer.WriteLine(isLast ? string.Empty : ",");
    }

    GenerateLua(0, tableName, groupedFrames, true);
}
