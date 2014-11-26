package P8_Websocket.model;

import java.io.IOException;
import java.io.Reader;

import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.spi.JsonProvider;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class StickerDecoder implements Decoder.TextStream<Sticker> {

 @Override
 public Sticker decode(Reader reader) throws DecodeException, IOException {
  JsonProvider provider = JsonProvider.provider();
  JsonReader jsonReader = provider.createReader(reader);
  JsonObject jsonSticker = jsonReader.readObject();
  
  System.out.println(jsonSticker.getString("action"));
  
  Sticker sticker = new Sticker();  //此時sticker為空的要用 Sticker.java裡的setter來給屬性
                                    
  if("add".equals(jsonSticker.getString("action"))){
	  
      sticker.setAction(jsonSticker.getString("action"));	  
      sticker.setX(jsonSticker.getInt("x"));
      sticker.setY(jsonSticker.getInt("y"));
      sticker.setImage(jsonSticker.getString("sticker"));
      sticker.setViewname(jsonSticker.getString("viewname"));
      sticker.setViewID(jsonSticker.getString("viewID"));
      sticker.setDraggable(jsonSticker.getString("draggable"));
  }
  
  if("back".equals(jsonSticker.getString("action"))){
	  
	  sticker.setAction(jsonSticker.getString("action"));	  
	  sticker.setX(jsonSticker.getInt("x"));
	  sticker.setY(jsonSticker.getInt("y"));
	  sticker.setImage(jsonSticker.getString("sticker"));
	  sticker.setViewname(jsonSticker.getString("viewname"));
	  sticker.setViewID(jsonSticker.getString("viewID"));
	  sticker.setDraggable(jsonSticker.getString("draggable"));
  }
  
  if("addchat".equals(jsonSticker.getString("action"))){
	  
	  sticker.setAction(jsonSticker.getString("action"));
	  sticker.setChat(jsonSticker.getString("chat"));
  }
  
  
  return sticker;
  
 }

    @Override
    public void init(EndpointConfig ec) {
    }

    @Override
    public void destroy() {
    }
}